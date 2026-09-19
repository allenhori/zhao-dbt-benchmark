select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v5, 0) + 7 as v1,
    p.v1 - p.v5 as v2,
    coalesce(p.v6, 0) + 7 as v3,
    round(p.v6 / 11.0, 4) as v4,
    case when p.v6 > 1100 then p.v6 else 0 end as v5,
    p.v6 * 7 as v6
from {{ ref('int_ev_0044') }} as p
where p.customer_id % 97 <> 0
