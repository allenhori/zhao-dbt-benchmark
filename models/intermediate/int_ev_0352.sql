select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 * 0.5 + p.v6 * 0.5 as v1,
    p.v6 + p.v5 as v2,
    round(p.v5 / 2.0, 4) as v3,
    p.v6 + 5 as v4,
    round(p.v1 / 2.0, 4) as v5,
    p.v1 + 5 as v6
from {{ ref('int_ev_0277') }} as p
