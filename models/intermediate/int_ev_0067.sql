select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v1, 0) + 11 as v1,
    p.v4 + 5 as v2,
    round(p.v1 / 7.0, 4) as v3,
    p.v4 * 3 as v4,
    coalesce(p.v1, 0) + 11 as v5,
    coalesce(p.v4, 0) + 3 as v6,
    round(p.v4 / 5.0, 4) as v7,
    p.v4 + p.v1 as v8
from {{ ref('int_ev_0006') }} as p
