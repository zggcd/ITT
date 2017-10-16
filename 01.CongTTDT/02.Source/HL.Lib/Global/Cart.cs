using System.Collections.Generic;
using System.Collections.ObjectModel;

namespace HL.Lib.Global
{
    public class CartItem
    {
        public int ProductID { get; set; }
        public int Quantity { get; set; }

        public override bool Equals(object obj)
        {
            if (obj is CartItem)
            {
                CartItem temp = obj as CartItem;

                return ProductID.Equals(temp.ProductID);
            }

            return base.Equals(obj);
        }

        public override int GetHashCode()
        {
            return (ProductID).GetHashCode();
        }
    }

    public class Cart
    {
        private List<CartItem> listItem = new List<CartItem>();
        private string cKey = "HL_Cart";

        public ReadOnlyCollection<CartItem> Items { get { return listItem.AsReadOnly(); } }

        public int Count
        {
            get { return listItem.Count; }
        }

        public Cart() : this(string.Empty)
        {
        }

        public Cart(string service_name)
        {
            cKey += service_name;

            if (ObjectCookies<List<CartItem>>.Exists(cKey))
                listItem = ObjectCookies<List<CartItem>>.GetValue(cKey);
        }

        public bool Exists(CartItem Item)
        {
            if (listItem.Contains(Item))
                return true;
            else
                return false;
        }

        public void Add(CartItem Item)
        {
            Remove(Item);

            listItem.Add(Item);
        }

        public CartItem Find(CartItem Item)
        {
            return listItem.Find(o => o.Equals(Item));
        }

        public void Remove(CartItem Item)
        {
            if (Exists(Item))
                listItem.Remove(Item);
        }

        public void RemoveAll()
        {
            listItem.Clear();
        }

        public void Save()
        {
            if (listItem.Count > 0)
                ObjectCookies<List<CartItem>>.SetValue(cKey, listItem);
            else
                ObjectCookies<List<CartItem>>.Remove(cKey);
        }
    }
}
