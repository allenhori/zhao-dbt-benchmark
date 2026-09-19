select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v3 + 13 as v1,
    case when p.v4 > 1300 then p.v4 else 0 end as v2,
    p.v3 * 13 as v3,
    case when p.v4 > p.v3 then p.v4 else p.v3 end as v4,
    p.v4 + 3 as v5,
    p.v3 * 5 as v6
from {{ ref('int_ev_0021') }} as p
where p.customer_id % 97 <> 0
