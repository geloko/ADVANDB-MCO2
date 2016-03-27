package Model;

import java.util.ArrayList;

public class QueryBuilder 
{
	private ArrayList<String> aggregates;
	private ArrayList<String> dimensions;
	private ArrayList<String> selections;
	private ArrayList<Boolean> isRange;
	private ArrayList<String> order;
	private ArrayList<String> groupBy;
	private String factTable;
	private ArrayList<String> dimensionFact;
	
	public QueryBuilder(String factTable)
	{
		this.factTable = factTable;
		aggregates = new ArrayList<String>();
		dimensions = new ArrayList<String>();
		selections = new ArrayList<String>();
		isRange = new ArrayList<Boolean>();
		order = new ArrayList<String>();
		dimensionFact = new ArrayList<String>();
		groupBy = new ArrayList<String>();
		
	}
	
	public void addAggregate(String aggregate)
	{
		aggregates.add(aggregate);
	}
	
	public void addDimensionFact(String dimensionFact)
	{
		//for adding dimensions of another fact table 
		this.dimensionFact.add(dimensionFact);
	}
	
	public void addDimension(String dimension)
	{
		dimensions.add(dimension);
	}
	
	public void addSelection(String selection, boolean isRange)
	{
		selections.add(selection);
		this.isRange.add(isRange);
	}
	
	public void addOrder(String orderby)
	{
		order.add(orderby);
	}
	
	public void addGroupBy(String groupBy)
	{
		this.groupBy.add(groupBy);
	}
	
	public String buildQuery()
	{
		String selectStr = "SELECT ";
		String fromStr = "FROM " + factTable + " f";
		String whereStr = "";
		String groupByStr = "";
		String orderByStr = "";
		
		for(int i = 0; i < aggregates.size(); i++)
		{
			if(i == 0)
			{
				selectStr += aggregates.get(i);
			}
			else
			{
				selectStr += ", " + aggregates.get(i);	
			}
		}
		
		for(int i = 0; i < dimensions.size(); i++)
		{
			fromStr += " INNER JOIN " + dimensions.get(i) + " ON (f." + dimensions.get(i) + "ID = " + dimensions.get(i) + ".id)";
		}
		
		if(selections.size() > 0)
		{
			whereStr = "WHERE ";
			for(int i = 0; i < selections.size(); i++)
			{
				if(i == 0)
				{
					whereStr += selections.get(i);
				}
				else
				{
					whereStr += " AND " + selections.get(i);	
				}
				
				if(isRange.get(i))
				{
					whereStr += " BETWEEN ? AND ?";
				}
				else
				{
					whereStr += " = ?";
				}
			}
		}
		
		if(groupBy.size() > 0)
		{
			groupByStr = "GROUP BY ";
			for(int i = 0; i < groupBy.size(); i++)
			{
				if(i > 0)
					groupByStr += ", ";
				groupByStr += groupBy.get(i);
			}
		}
		String fact = "";
		for(int i = 0; i < dimensionFact.size(); i++)
		{
			switch(dimensionFact.get(i))
			{
				case "household":
				case "crop":
				case "aquani":
				case "calamity": fromStr += " INNER JOIN " + dimensionFact.get(i) + " ON (" + dimensionFact.get(i) + ".locationID = f.locationID)";
								 fact = dimensionFact.get(i);
								 break;
				default: fromStr += " INNER JOIN " + dimensionFact.get(i) + " ON (" + dimensionFact.get(i) + ".id = " + fact + "." + dimensionFact.get(i) + "ID)";
			}
		}
		
		return selectStr + "\n" + fromStr + "\n" + whereStr + "\n" + groupByStr + "\n" + orderByStr;
	}
	
}
