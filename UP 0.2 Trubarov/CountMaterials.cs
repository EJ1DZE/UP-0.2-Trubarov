using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UP_0._2_Trubarov
{
    internal class CountMaterials
    {
        public int CountMaterial(int prodcutyTypeID, int materialTypeID, int productCount, double par1, double par2)
        {
            if (prodcutyTypeID <= 0 || materialTypeID <= 0 || productCount <= 0 || par1 <= 0 || par2 <= 0)
            {
                return -1;
            }

            var productType = GetProductType(prodcutyTypeID);
            if (productType == null)
            {
                return -1;
            }

            var materialType = GetMaterial_Type(materialTypeID);
            if (materialType == null)
            {
                return -1;
            }

            try
            {
                double materialUnit = par1 * par2 * Convert.ToDouble(productType.kfTypeProducts);
                double totalMaterial = materialUnit * productCount;
                double defectMultiplier = 1 + ((double)materialType.ScrapRate / 100);
                totalMaterial += defectMultiplier;
                return (int)Math.Ceiling(totalMaterial);
            }
            catch (Exception ex)
            {
                return -1;
            }
        }

        private ProductType GetProductType(int id)
        {
            using (var context = new Master_PolEntities())
            {
                return context.ProductType.FirstOrDefault(pt => pt.ID == id);
            }
        }

        private MaterialType GetMaterial_Type(int id)
        {
            using (var context = new Master_PolEntities())
            {
                return context.MaterialType.FirstOrDefault(mt => mt.ID == id);
            }
        }
    }
}
