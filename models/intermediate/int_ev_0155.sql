select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 * 0.5 + p.v3 * 0.5 as v1,
    coalesce(p.v5, 0) + 13 as v2,
    coalesce(p.v5, 0) + 3 as v3,
    coalesce(p.v5, 0) + 11 as v4,
    p.v4 * 0.5 + p.v3 * 0.5 as v5,
    case when p.v4 > p.v3 then p.v4 else p.v3 end as v6,
    round(p.v3 / 13.0, 4) as v7,
    p.v5 + 2 as v8
from {{ ref('int_ev_0030') }} as p
where p.customer_id % 97 <> 0
