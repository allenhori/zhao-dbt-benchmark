select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v7 + p.v6 as v1,
    p.v7 * 7 as v2,
    p.v7 - p.v6 as v3,
    round(p.v7 / 2.0, 4) as v4,
    p.v6 * 2 as v5,
    coalesce(p.v7, 0) + 2 as v6,
    p.v6 * 7 as v7,
    p.v6 + 5 as v8
from {{ ref('int_ev_0010') }} as p
