select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v4 - p.v7 as v1,
    p.v7 * 13 as v2,
    p.v7 * 3 as v3,
    case when p.v3 > p.v7 then p.v3 else p.v7 end as v4,
    case when p.v3 > p.v7 then p.v3 else p.v7 end as v5,
    p.v3 * 0.5 + p.v4 * 0.5 as v6
from {{ ref('int_ev_0016') }} as p
