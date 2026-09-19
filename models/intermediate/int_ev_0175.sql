select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v6, 0) + 7 as v1,
    round(p.v6 / 5.0, 4) as v2,
    coalesce(p.v1, 0) + 5 as v3,
    p.v1 + 13 as v4,
    coalesce(p.v6, 0) + 3 as v5,
    round(p.v1 / 3.0, 4) as v6,
    p.v6 + p.v5 as v7,
    p.v5 * 11 as v8
from {{ ref('int_ev_0021') }} as p
