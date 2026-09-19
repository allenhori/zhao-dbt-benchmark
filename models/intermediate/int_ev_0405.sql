select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v6 > 300 then p.v6 else 0 end as v1,
    case when p.v6 > 1300 then p.v6 else 0 end as v2,
    p.v4 + 7 as v3,
    p.v1 * 2 as v4,
    p.v4 + p.v1 as v5,
    round(p.v4 / 3.0, 4) as v6,
    case when p.v1 > 1300 then p.v1 else 0 end as v7
from {{ ref('int_ev_0401') }} as p
