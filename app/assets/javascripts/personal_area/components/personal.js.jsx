var Personal = React.createClass({
  haveHostel: function() {
      if (this.props.student.hostel == true){
        return 'Есть';
      } else {
        return 'Нет';
      };
    },
    render: function()  {
        return  (
            <div  className='container-fluid back'>
                <div  className='container-fluid white-line'></div>
                <div  className='container-fluid pink-line'>
                  <div className='text-center username'>{this.props.student.username}</div>
                </div>
                <div  className='container-fluid info-cont'>
                    <div className='col-xs-4 text-center'>
                      <img src={this.props.student.avatar.url} alt="avatar" className='img-circle'/>
                    </div>
                    <div className='col-xs-8'>
                        <table>
                            <tr>
                                <td className='info-first full-info'>ФИО</td>
                                <td className='info-second full-info'>{this.props.student.full_name}</td>
                            </tr>
                            <tr>
                                <td className='info-first full-info'>Страна</td>
                                <td className='info-second full-info'>{this.props.student.country}</td>
                            </tr>
                            <tr>
                                <td className='info-first full-info'>Дата рождения</td>
                                <td className='info-second full-info'>{this.props.student.birthday}</td>
                            </tr>
                            <tr>
                                <td className='info-first full-info'>Университет</td>
                                <td className='info-second full-info'>{this.props.univer.name + ' ('+this.props.univer.short_name+')'}</td>
                            </tr>
                            <tr>
                                <td className='info-first full-info'>Факультет</td>
                                <td className='info-second full-info'>{this.props.departament.name}</td>
                            </tr>
                            <tr>
                                <td className='info-first full-info'>Специальность</td>
                                <td className='info-second full-info'>{this.props.specialty.name}</td>
                            </tr>
                            <tr>
                                <td className='info-first full-info'>Наличие общежития</td>
                                <td className='info-second full-info'>{this.haveHostel()}</td>
                            </tr>
                        </table>
                    </div>
                    <div className='col-xs-4'></div>
                    <div className='col-xs-8'>
                        <div className='col-xs-3 circ'>
                            <div className='circle'>{this.props.student.rating}</div>
                            <div className='text-center text-circle'>Текущий рейтинг</div>
                        </div>
                        <div className='col-xs-3 text-center'>
                            <div className='circle'>{this.props.omis}</div>
                            <div className='text-center text-circle'>Пропуски <br/>(последний семестр)</div>
                        </div>
                        <div className='col-xs-3 text-center'>
                            <div className='circle'>{this.props.penal}</div>
                            <div className='text-center text-circle'>Выговоры и <br/>штрафы</div>
                        </div>
                    </div>
                </div>
                <div className='container-fluid marks-cont'>
                    <table className='hr-text'>
                        <td><hr className='half-hr' /></td>
                        <td className='text-hr'>УСПЕВАЕМОСТЬ</td>
                        <td><hr className='half-hr' /></td>
                    </table>
                </div>
            </div>
        )
    }
});