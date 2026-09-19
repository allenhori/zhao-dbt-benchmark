select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v6 > p.v4 then p.v6 else p.v4 end as v1,
    p.v4 + 3 as v2,
    p.v6 + p.v4 as v3,
    coalesce(p.v4, 0) + 13 as v4,
    round(p.v4 / 3.0, 4) as v5,
    p.v4 + 3 as v6,
    p.v6 * 5 as v7
from {{ ref('int_ev_0030') }} as p
where p.customer_id % 97 <> 0
