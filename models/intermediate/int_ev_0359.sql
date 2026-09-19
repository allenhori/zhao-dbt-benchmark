select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v4 > 200 then p.v4 else 0 end as v1,
    case when p.v4 > 300 then p.v4 else 0 end as v2,
    case when p.v6 > 1300 then p.v6 else 0 end as v3,
    case when p.v6 > 500 then p.v6 else 0 end as v4,
    p.v4 * 0.5 + p.v6 * 0.5 as v5,
    p.v6 * 11 as v6,
    p.v6 + 13 as v7
from {{ ref('int_ev_0029') }} as p
