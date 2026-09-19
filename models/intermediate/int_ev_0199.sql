select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v5 / 7.0, 4) as v1,
    p.v5 + p.v4 as v2,
    p.v7 * 13 as v3,
    p.v5 + p.v4 as v4,
    p.v4 * 3 as v5,
    p.v7 + 5 as v6
from {{ ref('int_ev_0124') }} as p
