select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v2 * 3 as v1,
    round(p.v1 / 3.0, 4) as v2,
    case when p.v4 > p.v2 then p.v4 else p.v2 end as v3,
    round(p.v1 / 11.0, 4) as v4,
    case when p.v1 > p.v2 then p.v1 else p.v2 end as v5,
    case when p.v4 > 300 then p.v4 else 0 end as v6
from {{ ref('int_ev_0404') }} as p
where p.customer_id % 97 <> 0
