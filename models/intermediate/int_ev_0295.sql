select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v4 > 300 then p.v4 else 0 end as v1,
    case when p.v4 > 500 then p.v4 else 0 end as v2,
    p.v4 * 7 as v3,
    case when p.v5 > p.v4 then p.v5 else p.v4 end as v4,
    p.v4 + p.v5 as v5,
    case when p.v4 > 1100 then p.v4 else 0 end as v6
from {{ ref('int_ev_0166') }} as p
where p.customer_id % 97 <> 0
