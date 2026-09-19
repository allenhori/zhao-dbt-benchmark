select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 * 5 as v1,
    p.v1 + p.v3 as v2,
    p.v1 + 5 as v3,
    case when p.v1 > 500 then p.v1 else 0 end as v4,
    p.v3 - p.v5 as v5,
    case when p.v1 > p.v3 then p.v1 else p.v3 end as v6
from {{ ref('int_ev_0021') }} as p
