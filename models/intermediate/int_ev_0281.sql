select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v4 + 2 as v1,
    round(p.v5 / 13.0, 4) as v2,
    case when p.v4 > 500 then p.v4 else 0 end as v3,
    p.v4 * 7 as v4,
    p.v6 * 11 as v5,
    p.v5 + 13 as v6
from {{ ref('int_ev_0018') }} as p
where p.customer_id % 97 <> 0
