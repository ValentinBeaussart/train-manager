<template>
  <div>
    <b-modal id="modal-prevent-closing" ref="modal" title="Ajouter un train" @show="resetModal" @hidden="resetModal"
      @ok="handleOk">
      <form ref="form" @submit.stop.prevent="handleSubmit">
        <b-form-group label="Destination" label-for="destination-input" invalid-feedback="Obligatoire"
          :state="destinationNameState">
          <b-form-select v-model="destination_id" :options="options"></b-form-select>
        </b-form-group>
        <b-form-group label="Heure de départ" label-for="departure_time-input" invalid-feedback="Obligatoire"
        :state="departureTimeState">
        <b-form-timepicker v-model="departure_time" locale="fr" placeholder="Sélectionnez l'heure de départ"></b-form-timepicker>
      </b-form-group>
      <b-form-group label="Heure d'arrivée" label-for="arrival_time-input" invalid-feedback="Obligatoire"
        :state="arrivalTimeState">
        <b-form-timepicker v-model="arrival_time" locale="fr" placeholder="Sélectionnez l'heure d'arrivée"></b-form-timepicker>
      </b-form-group>
      </form>
    </b-modal>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data () {
    return {
      options: [],
      destination_id: null,
      destination_name: '',
      arrival_time: '',
      departure_time: '',
      station_platform: '',
      destinationNameState: null,
      arrivalTimeState: null,
      departureTimeState: null
    }
  },
  created () {
    this.fetchDestinations()
  },
  methods: {
    async handleSubmit () {
      if (!this.checkFormValidity()) {
        return
      }

      try {
        const response = await axios.post('http://localhost:3000/api/v1/trains', {
          destination_id: this.destination_id,
          arrival_time: this.arrival_time,
          departure_time: this.departure_time,
          station_platform: this.station_platform
        })
        this.$refs.modal.hide()
        this.resetModal()
      } catch (error) {
        console.error('Une erreur s\'est produite lors de la création du train : ', error)
      }
    },

    fetchDestinations () {
      axios.get('http://localhost:3000/api/v1/destinations')
        .then(response => {
          this.options = response.data.map(destination => {
            return {
              value: destination.id,
              text: destination.name
            }
          })
        })
        .catch(error => {
          console.error('Une erreur s\'est produite lors de la récupération des destinations : ', error)
        })
    },

    checkFormValidity () {
      const valid = this.$refs.form.checkValidity()
      this.destinationNameState = valid
      this.arrivalTimeState = valid
      this.departureTimeState = valid
      return valid
    },
    resetModal () {
      this.destination_name = ''
      this.destinationNameState = null
      this.arrival_time = ''
      this.arrivalTimeState = null
      this.departure_time = ''
      this.departureTimeState = null
    },
    handleOk (bvModalEvent) {
      bvModalEvent.preventDefault()
      this.handleSubmit()
    }
    // handleSubmit () {
    //   if (!this.checkFormValidity()) {
    //     return
    //   }
    //   this.submittedNames.push(this.name)
    //   this.$nextTick(() => {
    //     this.$bvModal.hide('modal-prevent-closing')
    //   })
    // }
  }
}
</script>
