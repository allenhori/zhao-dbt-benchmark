select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v7 + 7 as v1,
    p.v6 * 3 as v2,
    round(p.v7 / 7.0, 4) as v3,
    p.v6 - p.v4 as v4,
    p.v6 * 0.5 + p.v7 * 0.5 as v5,
    round(p.v7 / 5.0, 4) as v6
from {{ ref('int_ev_0010') }} as p
