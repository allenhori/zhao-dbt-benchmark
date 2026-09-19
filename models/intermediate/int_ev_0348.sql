select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v1 / 2.0, 4) as v1,
    case when p.v4 > p.v1 then p.v4 else p.v1 end as v2,
    p.v3 * 0.5 + p.v4 * 0.5 as v3,
    p.v1 + 11 as v4,
    round(p.v3 / 3.0, 4) as v5,
    coalesce(p.v3, 0) + 7 as v6
from {{ ref('int_ev_0066') }} as p
where p.customer_id % 97 <> 0
