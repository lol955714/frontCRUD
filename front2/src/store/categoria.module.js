import categoria from '@/services/CategoriaService';
const user = JSON.parse(localStorage.getItem('user'));
const initialState = categoria;
export const categoria={
  namespaced: true,
  state: initialState,
  actions:{

  },
  mutations:{
    
  }
}
