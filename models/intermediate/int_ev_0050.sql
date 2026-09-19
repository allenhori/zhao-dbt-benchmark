select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v1 * 11 as v1,
    round(p.v2 / 5.0, 4) as v2,
    p.v1 + 11 as v3,
    round(p.v1 / 13.0, 4) as v4,
    p.v2 + 2 as v5,
    p.v1 * 11 as v6
from {{ ref('int_ev_0038') }} as p
