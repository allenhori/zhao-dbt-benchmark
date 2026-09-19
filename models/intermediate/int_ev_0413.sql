select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v5 > 1300 then p.v5 else 0 end as v1,
    p.v7 * 3 as v2,
    p.v5 * 2 as v3,
    case when p.v5 > 700 then p.v5 else 0 end as v4,
    p.v7 - p.v5 as v5,
    case when p.v7 > 300 then p.v7 else 0 end as v6,
    coalesce(p.v5, 0) + 13 as v7
from {{ ref('int_ev_0074') }} as p
where p.customer_id % 97 <> 0
