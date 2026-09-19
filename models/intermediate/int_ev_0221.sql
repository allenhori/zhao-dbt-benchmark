select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v2 - p.v6 as v1,
    case when p.v4 > 1300 then p.v4 else 0 end as v2,
    case when p.v6 > 1300 then p.v6 else 0 end as v3,
    round(p.v2 / 13.0, 4) as v4,
    coalesce(p.v2, 0) + 3 as v5,
    case when p.v6 > p.v2 then p.v6 else p.v2 end as v6,
    case when p.v6 > p.v2 then p.v6 else p.v2 end as v7
from {{ ref('int_ev_0020') }} as p
where p.customer_id % 97 <> 0
