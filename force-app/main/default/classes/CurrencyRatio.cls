public class CurrencyRatio {
	public String currencyInicials;
    public Decimal conversionRatio;
    
    public CurrencyRatio(String inicials, Decimal ratio){
        this.currencyInicials = inicials;
        this.conversionRatio = ratio;
    }
}