select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v3 + 13 as v1,
    p.v1 * 0.5 + p.v3 * 0.5 as v2,
    p.v1 + 13 as v3,
    p.v3 * 0.5 + p.v1 * 0.5 as v4,
    case when p.v3 > 1100 then p.v3 else 0 end as v5,
    p.v1 * 13 as v6,
    p.v1 + p.v3 as v7,
    case when p.v3 > 1300 then p.v3 else 0 end as v8
from {{ ref('int_ev_0021') }} as p
