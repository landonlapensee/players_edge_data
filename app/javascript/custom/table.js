const adjustTable = () => {
    var table = $('#dtDynamicVerticalScrollExample').DataTable();
    table.columns.adjust();
    console.log("hello baa");
};

const scrollableTable = () => {
    var table = $('#dtDynamicVerticalScrollExample').DataTable({
    // scroller: true, 
    scrollY: "75vh",
    // scrollX: true,
    // autoWidth: false,
    // scrollX: "10vw",
    // scrollCollapse: true
//     columnDefs: [{
//         targets: -1,
//         className: 'dt-body-right'
//     }]
    });

    setTimeout(function(){ table.columns.adjust(); }, 1000);
    
    console.log("hello baa");

    $('.dataTables_length').addClass('bs-select ');

    // $('a[data-toggle="tab"]').on('shown.bs.tab', function(e){
    //     $($.fn.dataTable.tables(true)).DataTable()
    //        .scroller.measure();
    //  }); 

    // adjustTable();
};





export { scrollableTable }; 
