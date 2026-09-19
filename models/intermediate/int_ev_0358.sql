select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v6 / 3.0, 4) as v1,
    p.v3 * 7 as v2,
    p.v6 - p.v3 as v3,
    p.v3 * 0.5 + p.v6 * 0.5 as v4,
    p.v3 * 0.5 + p.v6 * 0.5 as v5,
    p.v3 - p.v6 as v6
from {{ ref('int_ev_0030') }} as p
