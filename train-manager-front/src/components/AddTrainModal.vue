<template>
  <div>
    <b-modal hide-no-close-on-backdrop-button hide-close-button id="modal-prevent-closing" ref="modal" title="Ajouter un train" @show="resetModal" @hidden="resetModal"
      @ok="handleOk">
      <template v-slot:modal-header>
    <h5 class="modal-title">Ajouter un train</h5>
      </template>
      <form ref="form" @submit.stop.prevent="handleSubmit">
        <b-form-group label="Destination" label-for="destination-input" invalid-feedback="Champ obligatoire"
          :state="destinationNameState">
          <b-form-select v-model="destination_id" :options="options" required></b-form-select>
        </b-form-group>
        <b-form-group label="Heure de départ" label-for="departure_time-input" invalid-feedback="Champ obligatoire">
          <b-form-timepicker :state="departureTimeState" v-model="departure_time" :locale="locale"
            placeholder="Sélectionnez l'heure de départ" required @input="checkDepartureValidity" @context="onContext" v-bind="labels[locale] || {}"></b-form-timepicker>
        </b-form-group>
        <b-form-group label="Heure d'arrivée" label-for="arrival_time-input" invalid-feedback="Champ obligatoire">
          <b-form-timepicker :state="arrivalTimeState" v-model="arrival_time" :locale="locale"
            placeholder="Sélectionnez l'heure d'arrivée" required @input="checkArrivalValidity" @context="onContext" v-bind="labels[locale] || {}"></b-form-timepicker>
        </b-form-group>
        <b-alert v-if="createTrainsError !== null" class="mt-4" show variant="danger">{{ createTrainsError }}</b-alert>
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
      destination_name: null,
      arrival_time: null,
      departure_time: null,
      station_platform: '',
      destinationNameState: null,
      arrivalTimeState: null,
      departureTimeState: null,
      createTrainsError: null,
      locale: 'fr',
      labels: {
        fr: {
          labelNoTimeSelected: 'Aucune heure sélectionnée',
          labelCloseButton: 'Fermer'
        }
      }
    }
  },
  created () {
    this.fetchDestinations()
  },
  methods: {
    async handleSubmit () {
      if (!this.checkFormValidity() || !this.destination_id || !this.arrival_time || !this.departure_time) {
        return
      }

      try {
        await axios.post('http://localhost:3000/api/v1/trains', {
          destination_id: this.destination_id,
          arrival_time: this.arrival_time,
          departure_time: this.departure_time,
          station_platform: this.station_platform
        })
        this.$emit('trainAddedSuccessfully')
        this.$refs.modal.hide()
        this.resetModal()
        this.$nextTick(() => {
          this.$bvModal.hide('modal-prevent-closing')
        })
      } catch (error) {
        console.log(error)
        this.createTrainsError = error.response.data.error
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
      this.arrivalTimeState = this.checkValidity(this.arrival_time)
      this.departureTimeState = this.checkValidity(this.departure_time)
      return valid && this.arrivalTimeState && this.departureTimeState
    },
    checkValidity (time) {
      return time !== null && time !== ''
    },
    checkArrivalValidity () {
      this.arrivalTimeState = this.checkValidity(this.arrival_time)
    },
    checkDepartureValidity () {
      this.departureTimeState = this.checkValidity(this.departure_time)
    },
    resetModal () {
      this.destination_name = null
      this.destinationNameState = null
      this.arrival_time = null
      this.arrivalTimeState = null
      this.departure_time = null
      this.departureTimeState = null
      this.createTrainsError = null
    },
    handleOk (bvModalEvent) {
      bvModalEvent.preventDefault()
      this.handleSubmit()
    },
    onContext (ctx) {
      this.context = ctx
    }
  }
}
</script>
