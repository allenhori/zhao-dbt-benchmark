select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 + p.v1 as v1,
    round(p.v1 / 11.0, 4) as v2,
    coalesce(p.v5, 0) + 11 as v3,
    p.v1 - p.v5 as v4,
    p.v1 * 11 as v5,
    coalesce(p.v5, 0) + 7 as v6,
    round(p.v5 / 5.0, 4) as v7
from {{ ref('int_ev_0028') }} as p
