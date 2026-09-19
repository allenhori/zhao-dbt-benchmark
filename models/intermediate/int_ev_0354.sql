select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v2 * 13 as v1,
    round(p.v2 / 3.0, 4) as v2,
    p.v6 - p.v2 as v3,
    p.v2 + 13 as v4,
    p.v6 * 0.5 + p.v2 * 0.5 as v5,
    case when p.v6 > p.v2 then p.v6 else p.v2 end as v6
from {{ ref('int_ev_0284') }} as p
where p.customer_id % 97 <> 0
