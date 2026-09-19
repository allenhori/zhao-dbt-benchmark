select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v5, 0) + 3 as v1,
    case when p.v5 > 1100 then p.v5 else 0 end as v2,
    round(p.v5 / 11.0, 4) as v3,
    p.v4 * 7 as v4,
    case when p.v5 > 1100 then p.v5 else 0 end as v5,
    coalesce(p.v4, 0) + 11 as v6
from {{ ref('int_ev_0016') }} as p
where p.customer_id % 97 <> 0
