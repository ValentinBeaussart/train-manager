<template>
  <div>
    <b-table striped hover :items="trains" :fields="fields"></b-table>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data () {
    return {
      fields: [
        {
          key: 'id'
        },
        {
          key: 'destination'
        },
        {
          key: 'arrival_time'
        },
        {
          key: 'departure_time'
        },
        {
          key: 'station_platform'
        },
        {
          key: 'ajouter'
        },
        {
          key: 'supprimer'
        }
      ],
      trains: []
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
    }
  }
}
</script>
