select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.m4 + 3 as v1,
    round(p.m8 / 7.0, 4) as v2,
    round(p.m4 / 5.0, 4) as v3,
    round(p.m4 / 11.0, 4) as v4,
    p.m8 * 0.5 + p.m4 * 0.5 as v5,
    p.m4 - p.m8 as v6
from {{ ref('stg_ev_03') }} as p
