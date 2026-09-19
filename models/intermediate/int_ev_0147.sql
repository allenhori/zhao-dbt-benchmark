select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v2 > p.v1 then p.v2 else p.v1 end as v1,
    p.v1 + p.v2 as v2,
    case when p.v2 > 300 then p.v2 else 0 end as v3,
    p.v2 * 13 as v4,
    round(p.v1 / 7.0, 4) as v5,
    coalesce(p.v2, 0) + 5 as v6,
    p.v2 * 5 as v7
from {{ ref('int_ev_0026') }} as p
where p.customer_id % 97 <> 0
