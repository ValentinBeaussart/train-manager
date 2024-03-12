<template>
  <div>
    <b-table striped hover :items="trains" :fields="fields">
      <template v-slot:cell(delete)="data">
        <b-button @click="deleteTrain(data.item.id)" variant="danger"> <b-icon icon="trash"></b-icon> </b-button>
      </template>
    </b-table>
    <b-button v-b-modal.modal-prevent-closing @click="openModal">Ajouter un train</b-button>
    <AddTrainModal ref="addTrainModal" v-if="showModal" @close="closeModal"></AddTrainModal>
  </div>
</template>

<script>
import axios from 'axios'
import AddTrainModal from '@/components/AddTrainModal.vue'

export default {
  components: {
    AddTrainModal
  },
  data () {
    return {
      fields: [
        {
          key: 'id',
          label: 'ID'
        },
        {
          key: 'destination_name',
          label: 'Destination'
        },
        {
          key: 'departure_time',
          label: 'Départ'
        },
        {
          key: 'arrival_time',
          label: 'Arrivée'
        },
        {
          key: 'station_platform',
          label: 'Quai'
        },
        {
          key: 'delete',
          label: 'Supprimer'
        }
      ],
      trains: [],
      showModal: false
    }
  },
  created () {
    this.fetchTrains()
  },
  methods: {
    fetchTrains () {
      axios.get('http://localhost:3000/api/v1/trains')
        .then(response => {
          this.trains = response.data
          console.log(this.items)
        })
        .catch(error => {
          console.error('Une erreur s\'est produite lors de la récupération des trains : ', error)
        })
    },
    deleteTrain (id) {
      axios.delete('http://localhost:3000/api/v1/trains/' + id)
        .then(response => {
          this.fetchTrains()
        })
        .catch(error => {
          console.error('Une erreur s\'est produite lors de la suppression du train : ', error)
        })
    },
    openModal () {
      this.showModal = true
    },
    closeModal () {
      this.showModal = false
    }
  }
}
</script>
