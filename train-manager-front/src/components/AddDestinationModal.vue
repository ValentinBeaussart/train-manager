
<template>
  <div>
    <b-modal  id="modal-prevent-closing" ref="modal" title="Ajouter un train" @show="resetModal" @hidden="resetModal"
      @ok="handleOk">
      <template v-slot:modal-header>
        <h5 class="modal-title">Ajouter une destination</h5>
      </template>
      <form ref="form" @submit.stop.prevent="handleSubmit">
        <label for="input-live">Destination:</label>
        <b-form-input id="input-live" invalid-feedback="Champ obligatoire" :state="destinationNameState" v-model="destination_name" required @context="onContext"></b-form-input>
        <label for="input-live">Code de gare:</label>
        <b-form-input id="input-live" invalid-feedback="Champ obligatoire" :state="destinationStationCodeState" v-model="station_code" required @context="onContext"></b-form-input>
        <label for="input-live">Catégorie:</label>
        <b-form-input id="input-live" invalid-feedback="Champ obligatoire" :state="destinationCategoryState" v-model="category" required @context="onContext"></b-form-input>
        <b-alert v-if="createDestinationsError !== null" class="mt-4" show variant="danger">{{ createTrainsError }}</b-alert>
      </form>
      <template #modal-footer="{ ok, cancel }">
      <b-button size="m" variant="secondary" @click="cancel()">
        Annuler
      </b-button>
      <b-button size="m" variant="danger" @click="showMsgBoxTwo()">
        Valider
      </b-button>
    </template>
    </b-modal>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data () {
    return {
      options: [],
      destination_name: null,
      station_code: null,
      category: null,
      destinationNameState: null,
      destinationStationCodeState: null,
      destinationCategoryState: null,
      createDestinationsError: null,
      locale: 'fr'
    }
  },
  methods: {
    async handleSubmit () {
      if (!this.checkFormValidity() || !this.destination_name || !this.station_code || !this.category) {
        return
      }

      try {
        await axios.post('http://localhost:3000/api/v1/destinations', {
          name: this.destination_name,
          station_code: this.station_code,
          category: this.category
        })
        this.$emit('trainAddedSuccessfully')
        this.$refs.modal.hide()
        this.resetModal()
        this.$nextTick(() => {
          this.$bvModal.hide('modal-prevent-closing')
        })
      } catch (error) {
        console.log(error)
        this.createDestinationsError = error.response.data.error
      }
    },
    showMsgBoxTwo () {
      if (!this.checkFormValidity() || !this.destination_name || !this.station_code || !this.category) {
        return
      }
      this.$bvModal.msgBoxConfirm(`Êtes-vous sûr de vouloir ajouter la destination ${this.destination_name} qui aura le code de gare ${this.station_code} et acceptera les trains de category ${this.category}`, {
        title: 'Valider votre saisie',
        size: 'm',
        buttonSize: 'm',
        okVariant: 'danger',
        okTitle: 'CONFIRMER',
        cancelTitle: 'ANNULER',
        footerClass: 'p-2',
        hideHeaderClose: true,
        centered: true
      })
        .then(value => {
          if (value) {
            this.handleSubmit()
          }
        })
        .catch(err => {
          console.log(err)
        })
    },
    checkFormValidity () {
      const valid = this.$refs.form.checkValidity()
      this.destinationNameState = valid
      this.destinationStationCodeState = valid
      this.destinationCategoryState = valid
      return valid
    },
    resetModal () {
      this.destination_name = null
      this.destinationNameState = null
      this.station_code = null
      this.destinationStationCodeState = null
      this.category = null
      this.destinationCategoryState = null
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
