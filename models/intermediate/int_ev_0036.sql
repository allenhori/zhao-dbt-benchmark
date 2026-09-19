select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v1 * 0.5 + p.v7 * 0.5 as v1,
    p.v7 + p.v1 as v2,
    case when p.v1 > 1300 then p.v1 else 0 end as v3,
    p.v7 - p.v1 as v4,
    p.v1 * 0.5 + p.v2 * 0.5 as v5,
    round(p.v7 / 2.0, 4) as v6
from {{ ref('int_ev_0001') }} as p
