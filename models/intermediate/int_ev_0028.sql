select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v3, 0) + 2 as v1,
    p.v7 * 0.5 + p.v6 * 0.5 as v2,
    p.v6 + p.v7 as v3,
    p.v3 + p.v6 as v4,
    round(p.v7 / 2.0, 4) as v5,
    p.v3 + 3 as v6,
    p.v6 + 13 as v7,
    p.v7 * 0.5 + p.v6 * 0.5 as v8
from {{ ref('int_ev_0018') }} as p
