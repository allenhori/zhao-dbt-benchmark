select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v6 + 3 as v1,
    coalesce(p.v6, 0) + 13 as v2,
    p.v6 + 2 as v3,
    p.v6 + 13 as v4,
    p.v4 + 2 as v5,
    p.v4 + 7 as v6,
    round(p.v4 / 7.0, 4) as v7,
    p.v4 + p.v6 as v8
from {{ ref('int_ev_0018') }} as p
