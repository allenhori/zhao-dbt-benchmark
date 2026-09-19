select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v3 - p.v1 as v1,
    round(p.v1 / 7.0, 4) as v2,
    round(p.v3 / 5.0, 4) as v3,
    p.v3 + 7 as v4,
    p.v3 + 7 as v5,
    p.v3 + p.v1 as v6,
    p.v1 - p.v3 as v7,
    p.v1 * 7 as v8
from {{ ref('int_ev_0089') }} as p
