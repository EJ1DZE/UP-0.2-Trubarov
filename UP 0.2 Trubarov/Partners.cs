//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace UP_0._2_Trubarov
{
    using System;
    using System.Collections.Generic;
    
    public partial class Partners
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Partners()
        {
            this.PartnerProducts = new HashSet<PartnerProducts>();
        }
    
        public int ID { get; set; }
        public Nullable<int> partnerTypeID { get; set; }
        public string partnerName { get; set; }
        public string Director { get; set; }
        public string partnerEmail { get; set; }
        public string partnerPhone { get; set; }
        public string partnerAdress { get; set; }
        public string partnerINN { get; set; }
        public Nullable<int> partnerRating { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PartnerProducts> PartnerProducts { get; set; }
        public virtual PartnerType PartnerType { get; set; }
    }
}
