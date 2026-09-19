select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 * 0.5 + p.v1 * 0.5 as v1,
    case when p.v1 > p.v5 then p.v1 else p.v5 end as v2,
    p.v1 + 2 as v3,
    p.v1 * 3 as v4,
    p.v5 * 7 as v5,
    round(p.v5 / 7.0, 4) as v6,
    round(p.v1 / 2.0, 4) as v7,
    round(p.v1 / 7.0, 4) as v8
from {{ ref('int_ev_0021') }} as p
