select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 + 7 as v1,
    p.v2 * 7 as v2,
    p.v5 + 13 as v3,
    p.v2 * 0.5 + p.v5 * 0.5 as v4,
    p.v5 * 5 as v5,
    round(p.v2 / 7.0, 4) as v6
from {{ ref('int_ev_0015') }} as p
