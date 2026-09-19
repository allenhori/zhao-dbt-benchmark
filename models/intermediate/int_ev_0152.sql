select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v1 * 11 as v1,
    round(p.v2 / 7.0, 4) as v2,
    p.v1 + p.v2 as v3,
    case when p.v1 > p.v2 then p.v1 else p.v2 end as v4,
    p.v2 + 3 as v5,
    p.v1 + p.v2 as v6,
    p.v2 - p.v1 as v7
from {{ ref('int_ev_0030') }} as p
where p.customer_id % 97 <> 0
