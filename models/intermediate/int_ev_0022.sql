select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.m11 / 7.0, 4) as v1,
    coalesce(p.m11, 0) + 5 as v2,
    p.m11 * 0.5 + p.m10 * 0.5 as v3,
    p.m11 * 0.5 + p.m10 * 0.5 as v4,
    p.m10 * 0.5 + p.m12 * 0.5 as v5,
    coalesce(p.m10, 0) + 13 as v6
from {{ ref('stg_ev_03') }} as p
