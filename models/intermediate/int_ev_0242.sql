select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v6 * 0.5 + p.v2 * 0.5 as v1,
    p.v6 + 3 as v2,
    p.v1 + p.v2 as v3,
    case when p.v1 > 300 then p.v1 else 0 end as v4,
    round(p.v2 / 2.0, 4) as v5,
    round(p.v1 / 3.0, 4) as v6
from {{ ref('int_ev_0021') }} as p
where p.customer_id % 97 <> 0
