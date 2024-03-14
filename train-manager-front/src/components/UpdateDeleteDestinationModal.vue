<template>
  <div>
    <b-modal id="modal-prevent-closing" ref="modal" title="Mettre à jour ou supprimer une destination"
      @show="resetModal" @hidden="resetModal" @ok="handleOk">
      <template v-slot:modal-header>
        <h5 class="modal-title">Mettre à jour ou supprimer une destination</h5>
      </template>
      <div>
        <b-table :items="destinations" :fields="fields" select-mode="single" responsive="sm" ref="selectableTable"
          selectable @row-selected="onRowSelected">
          <template v-slot:cell(delete)="data">
            <b-button class="delete-btn" @click="showMsgBoxTwo(data.item.id)"><b-icon icon="trash"></b-icon></b-button>
          </template>
          <template #cell(selected)="{ rowSelected }">
            <template v-if="rowSelected">
              <span aria-hidden="true">&check;</span>
              <span class="sr-only">Selected</span>
            </template>
            <template v-else>
              <span aria-hidden="true">&nbsp;</span>
              <span class="sr-only">Not selected</span>
            </template>
          </template>
        </b-table>
        <template v-if="selected.length === 1">
          <form v-if="selected.length === 1" ref="form" @submit.stop.prevent="handleSubmit">
            <div>
              <label for="name">Nom:</label>
              <b-form-input invalid-feedback="Champ obligatoire" :state="destinationNameState" required
                @context="onContext" type="text" id="name" v-model="selected[0].name"></b-form-input>
            </div>
            <div>
              <label for="station_code">Code de gare:</label>
              <b-form-input invalid-feedback="Champ obligatoire" :state="destinationStationCodeState" required
                @context="onContext" type="text" id="station_code" v-model="selected[0].station_code"></b-form-input>
            </div>
            <div>
              <label for="category">Catégorie:</label>
              <b-form-input invalid-feedback="Champ obligatoire" :state="destinationCategoryState" required
                @context="onContext" type="text" id="category" v-model="selected[0].category"></b-form-input>
            </div>
            <b-button class="mt-2" variant="danger" @click="updateDestination(selected[0])">Mettre à jour</b-button>
            <b-alert v-if="this.updateError === true" class="error-message">Veuillez remplir tous les champs avant de soumettre.</b-alert>
          </form>
        </template>
      </div>
      <template #modal-footer="{ ok, cancel }">
        <b-button size="m" variant="secondary" @click="cancel()">
          Annuler
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
      fields: [
        {
          key: 'name',
          label: 'Nom'
        },
        {
          key: 'station_code',
          label: 'Code de gare'
        },
        {
          key: 'category',
          label: 'Catégorie'
        },
        {
          key: 'delete',
          label: 'Supprimer'
        }
      ],
      destinations: [],
      selected: [],
      updateError: false,
      destinationNameState: null,
      destinationStationCodeState: null,
      destinationCategoryState: null
    }
  },
  created () {
    this.fetchDestinations()
  },
  methods: {
    fetchDestinations () {
      axios.get('http://localhost:3000/api/v1/destinations')
        .then(response => {
          this.destinations = response.data
        })
        .catch(error => {
          console.error('Une erreur s\'est produite lors de la récupération des destinations : ', error)
        })
    },
    deleteDestination (id) {
      axios.delete('http://localhost:3000/api/v1/destinations/' + id)
        .then(response => {
          this.fetchDestinations()
        })
        .catch(error => {
          console.error('Une erreur s\'est produite lors de la suppression de la destination : ', error)
        })
    },
    updateDestination (destination) {
      if (!this.checkFormValidity() || !destination.name || !destination.station_code || !destination.category) {
        this.updateError = true
        return
      }
      axios.put(`http://localhost:3000/api/v1/destinations/${destination.id}`, {
        name: destination.name,
        station_code: destination.station_code,
        category: destination.category
      })
        .then(response => {
          this.fetchDestinations()
          this.$refs.modal.hide()
        })
        .catch(error => {
          console.error('Une erreur s\'est produite lors de la mise à jour de la destination : ', error)
        })
    },
    onRowSelected (items) {
      this.selected = items
    },
    showMsgBoxTwo (id) {
      this.$bvModal.msgBoxConfirm(`Êtes-vous sûr de vouloir supprimer la destination ${this.destination_name} qui a le code de gare ${this.station_code} et qui accepte les trains de category ${this.category}`, {
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
            this.deleteDestination(id)
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
      this.name = null
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

<style scoped>
.delete-btn {
  background-color: #C75C5C;
  border-color: #C75C5C;
}
</style>
