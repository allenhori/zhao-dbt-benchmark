select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v3, 0) + 2 as v1,
    round(p.v4 / 13.0, 4) as v2,
    coalesce(p.v3, 0) + 13 as v3,
    p.v4 * 13 as v4,
    p.v4 + p.v3 as v5,
    p.v6 * 7 as v6
from {{ ref('int_ev_0021') }} as p
