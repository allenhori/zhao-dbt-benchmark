select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v2 * 2 as v1,
    p.v2 + p.v5 as v2,
    case when p.v5 > 200 then p.v5 else 0 end as v3,
    case when p.v2 > 200 then p.v2 else 0 end as v4,
    coalesce(p.v2, 0) + 13 as v5,
    coalesce(p.v5, 0) + 5 as v6,
    p.v5 + 11 as v7
from {{ ref('int_ev_0192') }} as p
where p.customer_id % 97 <> 0
