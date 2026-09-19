select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v7 * 13 as v1,
    p.v1 * 2 as v2,
    p.v3 * 2 as v3,
    p.v7 + p.v3 as v4,
    p.v7 + 5 as v5,
    case when p.v3 > p.v7 then p.v3 else p.v7 end as v6,
    p.v7 * 13 as v7
from {{ ref('int_ev_0007') }} as p
