select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v8 + 5 as v1,
    p.v8 + 13 as v2,
    p.v8 * 13 as v3,
    coalesce(p.v7, 0) + 2 as v4,
    round(p.v7 / 2.0, 4) as v5,
    p.v7 + 3 as v6,
    coalesce(p.v8, 0) + 5 as v7
from {{ ref('int_ev_0018') }} as p
