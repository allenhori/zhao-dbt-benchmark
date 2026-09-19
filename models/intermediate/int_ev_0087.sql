select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 + 7 as v1,
    p.v5 + p.v3 as v2,
    round(p.v3 / 2.0, 4) as v3,
    p.v5 + p.v3 as v4,
    coalesce(p.v5, 0) + 5 as v5,
    p.v3 - p.v5 as v6,
    round(p.v5 / 2.0, 4) as v7
from {{ ref('int_ev_0019') }} as p
