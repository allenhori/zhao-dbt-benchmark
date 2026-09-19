select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v3 > p.v5 then p.v3 else p.v5 end as v1,
    case when p.v5 > 1100 then p.v5 else 0 end as v2,
    coalesce(p.v3, 0) + 2 as v3,
    case when p.v3 > 300 then p.v3 else 0 end as v4,
    case when p.v5 > 700 then p.v5 else 0 end as v5,
    round(p.v3 / 5.0, 4) as v6
from {{ ref('int_ev_0021') }} as p
where p.customer_id % 97 <> 0
